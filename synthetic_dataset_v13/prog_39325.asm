; DESCRIPTION: Places a white 20x91 rectangle at position (456, 21).
; PLAN: r0=456(x), r1=21(y), r2=20(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 21
LDI r2, 20
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

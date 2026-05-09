; DESCRIPTION: Places a white 65x30 rectangle at position (244, 223).
; PLAN: r0=244(x), r1=223(y), r2=65(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 223
LDI r2, 65
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

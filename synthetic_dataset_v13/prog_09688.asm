; DESCRIPTION: Places a white 111x100 rectangle at position (188, 100).
; PLAN: r0=188(x), r1=100(y), r2=111(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 100
LDI r2, 111
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

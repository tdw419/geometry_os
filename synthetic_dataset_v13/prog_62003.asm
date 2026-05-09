; DESCRIPTION: Renders a green box of size 68x46 starting at (297, 164).
; PLAN: r0=297(x), r1=164(y), r2=68(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 164
LDI r2, 68
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

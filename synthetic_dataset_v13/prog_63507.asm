; DESCRIPTION: Renders a green box of size 16x53 starting at (164, 158).
; PLAN: r0=164(x), r1=158(y), r2=16(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 158
LDI r2, 16
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

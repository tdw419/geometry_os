; DESCRIPTION: Renders a green box of size 32x29 starting at (244, 213).
; PLAN: r0=244(x), r1=213(y), r2=32(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 213
LDI r2, 32
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

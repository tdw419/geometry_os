; DESCRIPTION: Renders a yellow box of size 97x39 starting at (172, 213).
; PLAN: r0=172(x), r1=213(y), r2=97(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 213
LDI r2, 97
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

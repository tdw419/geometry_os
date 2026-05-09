; DESCRIPTION: Renders a black box of size 99x52 starting at (228, 187).
; PLAN: r0=228(x), r1=187(y), r2=99(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 187
LDI r2, 99
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

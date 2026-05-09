; DESCRIPTION: Renders a cyan box of size 118x14 starting at (213, 226).
; PLAN: r0=213(x), r1=226(y), r2=118(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 226
LDI r2, 118
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

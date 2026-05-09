; DESCRIPTION: Renders a cyan box of size 71x109 starting at (358, 127).
; PLAN: r0=358(x), r1=127(y), r2=71(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 127
LDI r2, 71
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

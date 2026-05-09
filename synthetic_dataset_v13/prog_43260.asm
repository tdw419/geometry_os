; DESCRIPTION: Renders a magenta box of size 27x115 starting at (438, 125).
; PLAN: r0=438(x), r1=125(y), r2=27(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 125
LDI r2, 27
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

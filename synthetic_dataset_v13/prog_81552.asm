; DESCRIPTION: Creates a blue rectangular region at (235, 127) spanning 42 by 51 pixels.
; PLAN: r0=235(x), r1=127(y), r2=42(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 127
LDI r2, 42
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

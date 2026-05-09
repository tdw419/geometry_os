; DESCRIPTION: Creates a purple rectangular region at (294, 195) spanning 65 by 36 pixels.
; PLAN: r0=294(x), r1=195(y), r2=65(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 195
LDI r2, 65
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

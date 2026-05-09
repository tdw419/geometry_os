; DESCRIPTION: Renders a purple box of size 16x42 starting at (229, 192).
; PLAN: r0=229(x), r1=192(y), r2=16(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 192
LDI r2, 16
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

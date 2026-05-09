; DESCRIPTION: Renders a purple box of size 42x55 starting at (392, 192).
; PLAN: r0=392(x), r1=192(y), r2=42(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 192
LDI r2, 42
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

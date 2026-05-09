; DESCRIPTION: Renders a purple box of size 48x42 starting at (65, 82).
; PLAN: r0=65(x), r1=82(y), r2=48(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 82
LDI r2, 48
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

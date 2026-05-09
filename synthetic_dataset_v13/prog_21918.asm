; DESCRIPTION: Places a magenta 75x71 rectangle at position (320, 65).
; PLAN: r0=320(x), r1=65(y), r2=75(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 65
LDI r2, 75
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

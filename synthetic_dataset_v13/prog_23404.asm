; DESCRIPTION: Places a magenta 42x83 rectangle at position (320, 169).
; PLAN: r0=320(x), r1=169(y), r2=42(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 169
LDI r2, 42
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

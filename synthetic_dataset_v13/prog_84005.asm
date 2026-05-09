; DESCRIPTION: Places a magenta 83x46 rectangle at position (140, 189).
; PLAN: r0=140(x), r1=189(y), r2=83(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 189
LDI r2, 83
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple 63x77 rectangle at position (177, 59).
; PLAN: r0=177(x), r1=59(y), r2=63(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 59
LDI r2, 63
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

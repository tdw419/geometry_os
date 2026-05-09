; DESCRIPTION: Places a blue 58x52 rectangle at position (263, 192).
; PLAN: r0=263(x), r1=192(y), r2=58(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 192
LDI r2, 58
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a magenta rectangular region at (392, 128) spanning 111 by 32 pixels.
; PLAN: r0=392(x), r1=128(y), r2=111(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 128
LDI r2, 111
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

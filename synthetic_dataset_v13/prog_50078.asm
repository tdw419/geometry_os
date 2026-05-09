; DESCRIPTION: Places a yellow 32x90 rectangle at position (296, 128).
; PLAN: r0=296(x), r1=128(y), r2=32(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 128
LDI r2, 32
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

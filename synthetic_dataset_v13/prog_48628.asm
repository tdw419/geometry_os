; DESCRIPTION: Places a black 39x64 rectangle at position (404, 63).
; PLAN: r0=404(x), r1=63(y), r2=39(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 63
LDI r2, 39
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

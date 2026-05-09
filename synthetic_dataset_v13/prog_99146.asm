; DESCRIPTION: Places a yellow 21x111 rectangle at position (387, 112).
; PLAN: r0=387(x), r1=112(y), r2=21(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 112
LDI r2, 21
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

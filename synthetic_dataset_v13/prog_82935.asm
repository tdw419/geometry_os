; DESCRIPTION: Places a yellow 73x45 rectangle at position (387, 86).
; PLAN: r0=387(x), r1=86(y), r2=73(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 86
LDI r2, 73
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

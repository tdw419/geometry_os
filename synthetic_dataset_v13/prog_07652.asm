; DESCRIPTION: Places a green 51x63 rectangle at position (193, 51).
; PLAN: r0=193(x), r1=51(y), r2=51(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 51
LDI r2, 51
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

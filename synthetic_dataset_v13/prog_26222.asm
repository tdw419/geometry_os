; DESCRIPTION: Places a green 96x51 rectangle at position (387, 95).
; PLAN: r0=387(x), r1=95(y), r2=96(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 95
LDI r2, 96
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple 51x40 rectangle at position (340, 209).
; PLAN: r0=340(x), r1=209(y), r2=51(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 209
LDI r2, 51
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

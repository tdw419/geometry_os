; DESCRIPTION: Places a blue 65x51 rectangle at position (303, 177).
; PLAN: r0=303(x), r1=177(y), r2=65(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 177
LDI r2, 65
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

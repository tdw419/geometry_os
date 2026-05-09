; DESCRIPTION: Places a cyan 52x107 rectangle at position (92, 51).
; PLAN: r0=92(x), r1=51(y), r2=52(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 51
LDI r2, 52
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

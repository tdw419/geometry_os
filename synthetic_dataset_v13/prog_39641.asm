; DESCRIPTION: Places a green 107x51 rectangle at position (104, 204).
; PLAN: r0=104(x), r1=204(y), r2=107(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 204
LDI r2, 107
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

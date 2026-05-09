; DESCRIPTION: Places a yellow 60x95 rectangle at position (177, 125).
; PLAN: r0=177(x), r1=125(y), r2=60(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 125
LDI r2, 60
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

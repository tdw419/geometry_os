; DESCRIPTION: Places a green 79x102 rectangle at position (333, 112).
; PLAN: r0=333(x), r1=112(y), r2=79(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 112
LDI r2, 79
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

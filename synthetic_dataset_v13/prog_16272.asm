; DESCRIPTION: Places a green 59x120 rectangle at position (362, 96).
; PLAN: r0=362(x), r1=96(y), r2=59(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 96
LDI r2, 59
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

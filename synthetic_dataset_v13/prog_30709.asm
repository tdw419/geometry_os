; DESCRIPTION: Places a yellow 107x117 rectangle at position (368, 60).
; PLAN: r0=368(x), r1=60(y), r2=107(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 60
LDI r2, 107
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

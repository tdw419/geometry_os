; DESCRIPTION: Places a red 51x27 rectangle at position (104, 202).
; PLAN: r0=104(x), r1=202(y), r2=51(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 202
LDI r2, 51
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a red 71x86 rectangle at position (332, 118).
; PLAN: r0=332(x), r1=118(y), r2=71(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 118
LDI r2, 71
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

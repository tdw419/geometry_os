; DESCRIPTION: Places a red 22x14 rectangle at position (202, 107).
; PLAN: r0=202(x), r1=107(y), r2=22(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 107
LDI r2, 22
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

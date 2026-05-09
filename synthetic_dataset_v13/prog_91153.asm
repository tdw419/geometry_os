; DESCRIPTION: Places a red 44x45 rectangle at position (209, 167).
; PLAN: r0=209(x), r1=167(y), r2=44(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 167
LDI r2, 44
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

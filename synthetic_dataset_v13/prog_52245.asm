; DESCRIPTION: Places a red 27x98 rectangle at position (209, 5).
; PLAN: r0=209(x), r1=5(y), r2=27(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 5
LDI r2, 27
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

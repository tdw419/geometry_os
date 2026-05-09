; DESCRIPTION: Places a red 27x22 rectangle at position (298, 151).
; PLAN: r0=298(x), r1=151(y), r2=27(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 151
LDI r2, 27
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

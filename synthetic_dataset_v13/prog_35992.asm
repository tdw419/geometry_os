; DESCRIPTION: Places a red 27x72 rectangle at position (445, 172).
; PLAN: r0=445(x), r1=172(y), r2=27(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 172
LDI r2, 27
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a red 98x77 rectangle at position (384, 77).
; PLAN: r0=384(x), r1=77(y), r2=98(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 77
LDI r2, 98
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a yellow 73x77 rectangle at position (42, 54).
; PLAN: r0=42(x), r1=54(y), r2=73(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 54
LDI r2, 73
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

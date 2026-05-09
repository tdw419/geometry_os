; DESCRIPTION: Places a green 108x77 rectangle at position (285, 146).
; PLAN: r0=285(x), r1=146(y), r2=108(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 146
LDI r2, 108
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

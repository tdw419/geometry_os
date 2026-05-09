; DESCRIPTION: Renders a cyan box of size 21x77 starting at (218, 81).
; PLAN: r0=218(x), r1=81(y), r2=21(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 81
LDI r2, 21
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

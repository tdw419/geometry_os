; DESCRIPTION: Renders a cyan box of size 44x64 starting at (283, 115).
; PLAN: r0=283(x), r1=115(y), r2=44(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 115
LDI r2, 44
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

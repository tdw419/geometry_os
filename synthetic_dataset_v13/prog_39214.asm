; DESCRIPTION: Places a cyan 27x112 rectangle at position (444, 41).
; PLAN: r0=444(x), r1=41(y), r2=27(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 41
LDI r2, 27
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

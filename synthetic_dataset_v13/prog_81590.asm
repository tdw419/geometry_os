; DESCRIPTION: Places a cyan 62x34 rectangle at position (444, 182).
; PLAN: r0=444(x), r1=182(y), r2=62(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 182
LDI r2, 62
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

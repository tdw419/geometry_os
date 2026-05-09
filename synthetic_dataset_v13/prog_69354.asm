; DESCRIPTION: Renders a cyan box of size 83x32 starting at (259, 121).
; PLAN: r0=259(x), r1=121(y), r2=83(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 121
LDI r2, 83
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a cyan box of size 46x52 starting at (363, 29).
; PLAN: r0=363(x), r1=29(y), r2=46(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 29
LDI r2, 46
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

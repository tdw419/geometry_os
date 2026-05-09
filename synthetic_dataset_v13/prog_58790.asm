; DESCRIPTION: Renders a cyan box of size 46x25 starting at (372, 98).
; PLAN: r0=372(x), r1=98(y), r2=46(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 98
LDI r2, 46
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a cyan box of size 98x109 starting at (108, 21).
; PLAN: r0=108(x), r1=21(y), r2=98(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 21
LDI r2, 98
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

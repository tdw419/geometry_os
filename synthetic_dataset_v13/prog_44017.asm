; DESCRIPTION: Renders a cyan box of size 34x40 starting at (304, 168).
; PLAN: r0=304(x), r1=168(y), r2=34(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 168
LDI r2, 34
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a cyan box of size 103x16 starting at (213, 190).
; PLAN: r0=213(x), r1=190(y), r2=103(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 190
LDI r2, 103
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

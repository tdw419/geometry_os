; DESCRIPTION: Composite: Sets a single purple pixel at (507, 215) then Renders a cyan box of size 64x46 starting at (301, 180).
; PLAN: r0=507(x), r1=215(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=301(x), r6=180(y), r7=64(width), r8=46(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 507
LDI r1, 215
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 301
LDI r6, 180
LDI r7, 64
LDI r8, 46
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT

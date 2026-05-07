; mixed program
; initialization
  LDI r8, 256
  LDI r10, 256
  LDI r11, 4
  IKEY r6
  CMPI r6, 205
  JNZ r6, key_0
  SAR r6, r15, r10
  SHR r0, r12, r7
  SHLI r1, r11, 0xEB41BA
  CMPI r14, 16
  CMP r6, r2
  LDI r3, 5
loop_1:
  ADDI r7, r9, 0x90CC64
  ANDI r4, r7, 0x0B82EF
  CMPI r2, r7, 256
  SUB r9, r3, r8
  LDI r5, 1
  SUB r3, r3, r5
  JNZ r3, loop_1
  SHLI r14, r8, 16
  SHL r10, r8, r13
main_2:
  ADDI r3, r10, 38
  ANDI r3, r14, 64
  LDI r11, 0x899F7D
  LDI r13, 32
  LDI r2, 0xF1BA1C
  TEXT r11, r13, r2, "HELLO"
  IKEY r10
  CMPI r10, 124
  JNZ r10, key_3
  ANDI r15, r4, 0xE8EA8A
  LDI r3, 796
  LDI r9, 256
  LDI r5, 0x4693E9
  PSET r3, r9, r5
  FRAME
  JMP main_2
